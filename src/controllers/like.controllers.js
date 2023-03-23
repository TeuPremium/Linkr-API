import { db } from "../database/database.connection.js";

//enviar infomações de like
export async function getLikes(req, res) {}

//registrar um like
export async function postLike(req, res) {
  const { userId, postId } = req.body;

  try {
    await db.query(`INSERT INTO likes ("userId", "PostId") VALUES ($1, $2)`, [
      userId,
      postId,
    ]);
    res.sendStatus(200);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

//deletar o like
export async function deleteLike(req, res) {}
