import { db } from "../database/database.connection.js";

export async function getUser(req, res) {
  const { username } = req.body;

  try {
    const completeUsername = await db.query(
      `
      SELECT id AS "userId", username, image AS "imageUrl" 
      FROM users 
      WHERE username LIKE $1 
      ORDER BY username ASC
      `,
      [`%${username}%`]
    );

    return res.status(201).send(completeUsername.rows);
  } catch (err) {
    return res.status(500).send(err.message);
  }
}
