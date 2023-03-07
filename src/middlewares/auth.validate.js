import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export async function singupValidate(req, res, next) {
  const { email, password, consfirmPassword } = req.body;

  if (password !== consfirmPassword) {
    return res.status(422).send("As senha são diferentes.");
  }

  try {
    const userExist = await db.query(`SELECT * FROM users WHERE email = $1`, [
      email,
    ]);

    if (userExist.rowCount) {
      return res.status(409).send("Usuário já cadastrado");
    }

    res.locals.user = { email, password };
    next();
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function singinValidate(req, res, next) {
  const { email, password } = req.body;

  const userExist = await db.query(`SELECT * FROM users WHERE email = $1`, [
    email,
  ]);

  if (!userExist.rowCount) {
    return res.status(401).send("Usuário não cadastrado.");
  }

  if (!bcrypt.compareSync(password, userExist.rows[0].password)) {
    return res.status(401).send("Senha invalida.");
  }
  res.locals.user = userExist.rows[0];
  next();
}

//usar em rotas autenticadas
export async function authToken(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) return res.status(401).send("Usuário não autorizado.");

  try {
    const verifyToken = jwt.verify(token, process.env.SECRET);

    //depois que você usar o authToken, em uma rota você pode criar no proximo parametro o ...
    //.. const {email, userId} = res.locals.token
    res.locals.token = verifyToken;

    next();
  } catch (error) {
    res.status(401).send(error.message);
  }
}
