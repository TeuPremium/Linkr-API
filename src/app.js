import express from "express";
import cors from "cors";
import { authRouter } from "./routes/auth.routes.js";
import { postRouter } from "./routes/postRoutes.js";
import { hashtags } from "./routes/hashtagRoutes.js";
import { userRouter } from "./routes/user.routes.js";
import { likeRouter } from "./routes/likes.routes.js";


const server = express();
server.use(cors());
server.use(express.json());

server.use([authRouter, postRouter, hashtags, likeRouter, userRouter]);


const PORT = process.env.PORT || 5000;

server.listen(PORT, console.log(`servidor conectado na porta: ${PORT}`));
