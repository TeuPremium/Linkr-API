import { db } from "../database/database.connection.js";

export async function getUser(req, res) {
  const { username } = req.body;
  
  try {
    const completeUsername = await db.query(
      `SELECT username, id AS "userId" FROM users WHERE username LIKE $1`,
      [`%${username}%`]
    );

    return res.status(201).send(completeUsername.rows[0]);
  } catch (err) {
    return res.status(500).send(err.message);
  }
}
