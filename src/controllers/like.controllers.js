import { db } from "../database/database.connection.js";

//enviar infomações de like
export async function getLikes(req, res) {
  const { postId } = req.params.postId;
  try {
    const result = await db.query(
      `SELECT users.name FROM likes
         JOIN users ON likes."userId" = users.id
         WHERE likes."postId" = $1;`,
      [postId]
    );
    const likedUsers = result.rows.map((e) => e.name);
    res.send({ likedUsers, count: likedUsers.length }).status(200);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

//registrar um like
export async function postLike(req, res) {
  const { userId, postId } = req.body;

  try {
    await db.query(`INSERT INTO likes ("userId", "postId") VALUES ($1, $2);`, [
      userId,
      postId,
    ]);
    res.sendStatus(200);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

//deletar o like
export async function deleteLike(req, res) {
  const { userId, postId } = req.body;

  try {
    await db.query(`DELETE FROM likes ("userId", "postId) VALUES ($1, $2) ;`, [
      userId,
      postId,
    ]);
    res.sendStatus(202);
  } catch (error) {
    res.status(500).send(error.message);
  }
}
