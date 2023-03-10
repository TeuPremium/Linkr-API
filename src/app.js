import express from "express";
import cors from "cors";
import { authRouter } from "./routes/auth.routes.js";
import { postRouter } from "./routes/postRoutes.js";
import { hashtagRank } from "./routes/rankHashtagroute.js";


const server = express();
server.use(cors());
server.use(express.json());

server.use([authRouter, postRouter, hashtagRank]);

const PORT = process.env.PORT || 5000

server.listen(PORT, console.log(`servidor conectado na porta: ${PORT}`));
