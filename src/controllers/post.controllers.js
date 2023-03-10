import { db } from "../database/database.connection.js";

export async function addPost(req, res) {
  try {
    const { url, comment, userId } = req.body;

    await db.query(
      'INSERT INTO posts (url, "userId", comment) VALUES ($1,$2,$3)',
      [url, userId, comment]
    );

    return res.sendStatus(201);
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
  try {
    const getPosts = await db.query(`
        SELECT users.username, users.image, posts.url, posts.comment, users.id, posts.id as "postId" 
        FROM users, posts 
        WHERE users.id = posts."userId"
        ORDER BY posts.id
        DESC LIMIT 20 
        `);

    console.log(getPost.rows);
    return res.status(200).send(getPosts.rows);
  } catch (error) {
    if (error.detail) {
      return res.status(500).send(error.detail);
    } else {
      return res.status(500).send(error.message);
    }
  }
}

export async function getUserPosts(req, res) {
  const { id } = req.params;

  try {
    const getPosts = await db.query(
      `
        SELECT users.username, users.image, posts.url, posts.comment, users.id
        FROM users, posts 
        WHERE users.id = $1
        ORDER BY posts.id
        DESC 
        `,
      [id]
    );

    console.log(getPost.rows);
    return res.status(200).send(getPosts.rows);
  } catch (error) {
    if (error.detail) {
      return res.status(500).send(error.detail);
    } else {
      return res.status(500).send(error.message);
    }
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
