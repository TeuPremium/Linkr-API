import { db } from "../database/database.connection.js";

export async function getLikeRepository(postId) {
  return db.query(
    `SELECT users.id, users.username FROM likes
           JOIN users ON likes."userId" = users.id
           WHERE likes."postId" = $1;`,
    [postId]
  );
}

export async function likeRepository(userId, postId) {
  return db.query(`INSERT INTO likes ("userId", "postId") VALUES ($1, $2);`, [
    userId,
    postId,
  ]);
}
export async function deslikeRepository(userId, postId) {
  return db.query(`DELETE FROM likes WHERE "userId" = $1 AND "postId" = $2 ;`, [
    userId,
    postId,
  ]);
}
