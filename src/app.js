import express from "express";
import cors from "cors";
import { authRouter } from "./routes/auth.routes";

const server = express();
server.use(cors());
server.use(express.json());

server.use([authRouter]);

server.listen(process.env.PORT, console.log("servidor conectado na PORT"));
