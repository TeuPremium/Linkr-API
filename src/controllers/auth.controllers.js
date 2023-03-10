import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { signupRepository } from "../repositories/authRepository.js";


export async function signup(req, res) {
  const { username, password, pictureUrl } = req.body;
  const { email } = res.locals.user;

  const hashedPassword = bcrypt.hashSync(password, 10);

  try {
    await signupRepository(username, email, hashedPassword, pictureUrl);

    res.status(201).send("Conta criada com sucesso.");
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function signin(req, res) {
  const { email, id } = res.locals.user;
  try {
    // estou passando como parametro o email e o id do usuario junto ao token formado pelo jwt
    
    const token = jwt.sign({ email, userId: id }, process.env.SECRET, {
      expiresIn: "10h",
    });

    return res.status(200).send({ token, email, userId: id });
  } catch (error) {
    res.status(500).send(error.message);
  }
}
