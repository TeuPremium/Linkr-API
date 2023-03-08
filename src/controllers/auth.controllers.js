import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export async function signup(req, res) {
  const { username, password, pictureUrl } = req.body;
  const { email } = res.locals.user;

  const hashedPassword = bcrypt.hashSync(password, 10);

  try {
    await db.query(
      `INSERT INTO users (username, email, password, image) VALUES ($1, $2 , $3, $4);`,
      [username, email, hashedPassword, pictureUrl]
    );

    res.status(201).send("Conta criada com sucesso.");
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function signin(req, res) {
  const { email, id } = res.locals.user;
  try {
    //deixei o token para expirar em 100h, para facilitar na pordução, e não ter q ficar copiando tokens sempre, lembrar de apagar!!!!!!
    // aqui também estou passando como parametro o email e o id do usuario junto ao token formado pelo jwt
    // no SECRET do .env você pode escrever qualquer coisa SECRET=QUALQUERCOISA
    const token = jwt.sign({ email, userId: id }, process.env.SECRET, {
      expiresIn: "100h",
    });

    return res.status(200).send({ token, email, userId: id });
  } catch (error) {
    res.status(500).send(error.message);
  }
}
