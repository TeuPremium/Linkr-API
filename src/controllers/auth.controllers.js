import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export async function signup(req, res) {
  const { name } = req.body;
  const { email, password } = res.locals.user;

  const hashedPassword = bcrypt.hashSync(password, 10);

  try {
    await db.query(
      `INSERT INTO users (name, email, password) VALUES ($1, $2 , $3);`,
      [name, email, hashedPassword]
    );

    res.status(201).send("Conta criada com sucesso.");
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function signin(req, res) {}
