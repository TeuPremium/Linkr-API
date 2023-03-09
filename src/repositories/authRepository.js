import { db } from "../database/database.connection.js";

export async function signupRepository(
  username,
  email,
  hashedPassword,
  pictureUrl
) {
  return db.query(
    `INSERT INTO users (username, email, password, image) VALUES ($1, $2 , $3, $4);`,
    [username, email, hashedPassword, pictureUrl]
  );
}

export async function verifyUser(email) {
  return db.query(`SELECT * FROM users WHERE email = $1`, [email]);
}
