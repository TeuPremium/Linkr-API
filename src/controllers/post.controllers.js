import { db } from "../database/database.connection.js";
import * as cheerio from "cheerio";
import fetch from "node-fetch";
import { addTag } from "./hashtags.controller.js";

export async function addPost(req, res) {
  try {
    const { url, comment, userId } = req.body;
    const urlData = await scrapeData(url)
    const {title, description, image} = urlData
    const post = await db.query(
      `
      INSERT INTO posts (url, "userId", comment, title, description, image)
      VALUES ($1,$2,$3,$4,$5,$6)
      RETURNING id
       `,
      [url, userId, comment, urlData.title, urlData.description, urlData.image]
    );
      
    const getUserName = await db.query(`
    SELECT username 
      FROM users
      WHERE id = $1
      `, [userId])
      
      
      getUserName.rows[0].title = title;
      getUserName.rows[0].description = description;
      getUserName.rows[0].postImage = image;
      getUserName.rows[0].id = userId;
      getUserName.rows[0].postId = post.rows[0].id;
      
      addTag(comment, post.rows[0].id)
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
    const { id } = req.params;
    
    await db.query("DELETE FROM posts WHERE id = ($1)", [id]);

    return res.sendStatus(202);
  } catch (error) {
    return res.status(500).send(error.detail);
  }
}

export async function getPost(req, res) {
  const limit = req.params.limit || 10;
  const offset = limit - 10;

  try {
    const getPosts = await db.query(`
    SELECT users.username, users.image, posts.url, posts.title, posts.image as "postImage",
    posts.description, posts.comment, users.id, posts.id as "postId" 
    FROM users, posts 
    WHERE users.id = posts."userId"
    ORDER BY posts.id
    DESC LIMIT ${10} OFFSET ${offset}
    `);
    
    return res.status(200).send(getPosts.rows);
  } catch (error) {
    if (error.detail) {
      return res.status(500).send(error.detail);
    } else {
      return res.status(500).send(error.message);
    }
  }
}

export async function getPostById(req, res) {
  const {postId} = req.body

  try {
    const getPosts = await db.query(`
    SELECT users.username, users.image, posts.url, posts.title, posts.image as "postImage",
    posts.description, posts.comment, users.id, posts.id as "postId" 
    FROM users, posts 
    WHERE post.id = $1
    ORDER BY posts.id
    `, );
    
    return res.status(200).send(getPosts.rows);
  } catch (error) {
    if (error.detail) {
      return res.status(500).send(error.detail);
    } else {
      return res.status(500).send(error.message);
    }
  }
}

async function scrapeData(url) {
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
    const getUserPosts = await db.query(
      `
        SELECT users.id, users.username, users.image, posts.url, posts.comment, posts.id as "postId"
        FROM users, posts
        WHERE users.id = $1 AND posts."userId"= $1
        ORDER BY posts.id DESC
        `,
      [id]
    );

    if (getUserPosts.rows.length === 0) {
      const getUserOnly = await db.query(
        `SELECT id AS userId, username, image FROM users WHERE users.id = $1`,
        [id]
      );

      return res.status(200).send(getUserOnly.rows);
    } else {
      const urlData = [];
      let url;
      for (let index = 0; index < getUserPosts.rows.length; index++) {
        let url = getUserPosts.rows[index].url;
        const element = await scrapeData(url);
        getUserPosts.rows[index].urlData = element;
      }

      return res.status(200).send(getUserPosts.rows);
    }
  } catch (error) {
    return res.status(500).send(error.message);
  }
}

export async function editPost(req, res) {
  try {
    const { comment } = req.body;
    const { id } = req.params
    
    const updatePost = await db.query(
      `
      UPDATE posts
      SET comment = $1              
      WHERE id = $2
      RETURNING comment
      `,
      [comment, id]
      );

      addTag(comment, id)
    return res.status(200).send(updatePost.rows[0]);
  } catch (error) {
    return res.status(500).send(error.detail);
  }
}
