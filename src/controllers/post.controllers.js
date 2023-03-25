import { db } from "../database/database.connection.js";
import * as cheerio from 'cheerio';
import fetch from "node-fetch";

export async function addPost(req, res) {
  try {
    const { url, comment, userId } = req.body;

     await db.query(
      `
      INSERT INTO posts (url, "userId", comment)
      VALUES ($1,$2,$3)
       `,
      [url, userId, comment]
    );
      const getUserName = await db.query(`
      SELECT username 
      FROM users
      WHERE id = $1
      `, [userId])
      

      const urlData = await scrapeData(url)
      getUserName.rows[0].urlData = urlData;

    return res.send(getUserName.rows[0]).status(201);
  } catch (error) {
    if (error.detail.includes("is not present in table")) {
      return res.status(404).send(error.detail);
    }
    return res.status(500).send(error.detail);
  }
}

export async function deletePost(req, res) {
  try {
    const { postId } = req.body;

    await db.query("DELETE FROM posts WHERE id = ($1)", [postId]);

    return res.sendStatus(202);
  } catch (error) {
    if (error.detail.includes("is not present in table")) {
      return res.status(404).send(error.detail);
    }
    return res.status(500).send(error.detail);
  }
}

export async function getPost(req, res) {
  const limit = req.params.limit || 10;
  const offset = limit - 10;

  try {
    const getPosts = await db.query(`
    SELECT users.username, users.image, posts.url, posts.comment, users.id, posts.id as "postId" 
    FROM users, posts 
    WHERE users.id = posts."userId"
    ORDER BY posts.id
    DESC LIMIT ${10} OFFSET ${offset}
    `);
    const urlData = [];
    let url;
    for (let index = 0; index < getPosts.rows.length; index++) {
      let url = getPosts.rows[index].url;
      const element = await scrapeData(url);
      getPosts.rows[index].urlData = element;
    }

    return res.status(200).send(getPosts.rows);
  } catch (error) {
    if (error.detail) {
      return res.status(500).send(error.detail);
    } else {
      return res.status(500).send(error.message);
    }
  }
}

async function scrapeData(url){

  try {
    const response = await fetch(url);
    const html = await response.text();
    const $ = cheerio.load(html);
    const title = $("title").text();
    const description = $('meta[name="description"]').attr("content");
    const image = $('meta[property="og:image"]').attr("content");

    return {
      title,
      description,
      image,
    };
  } catch (error) {
    return { title: null, description: null, image: null };
  }
}

export async function getUserPosts(req, res) {
  const { id } = req.params;

  try {
    const getPosts = await db.query(
      `
        SELECT users.username, users.image, posts.url, posts.comment, users.id, posts.id as "postId"
        FROM users, posts 
        WHERE users.id = $1
        ORDER BY posts.id
        DESC 
        `,
      [id]
    );
    return res.status(200).send(getPosts.rows);
  } catch (error) {
    return res.status(500).send(error.message);
  }
}

export async function editPost(req, res) {
  try {
    const { comment, postId } = req.body;
    const updatePost = await db.query(
      `
            UPDATE posts
            SET comment = $1              
            WHERE id = $2
        `,
      [comment, postId]
    );

    return res.sendStatus(200);
  } catch (error) {
    if (error.detail.includes("is not present in table")) {
      return res.status(404).send(error.detail);
    }
    return res.status(500).send(error.detail);
  }
}
