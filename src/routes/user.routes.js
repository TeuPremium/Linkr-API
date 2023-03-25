import { Router } from "express";
import { getUser } from "../controllers/user.controller.js";
import { schemaValidate } from "../middlewares/schema.validate.js";
import { userSchema } from "../schemas/user.schema.js";

export const userRouter = Router();

userRouter.post("/user", schemaValidate(userSchema), getUser)
