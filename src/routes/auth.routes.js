import { Router } from "express";
import { signin, signup } from "../controllers/auth.controllers.js";
import { singinValidate, singupValidate } from "../middlewares/auth.validate.js";
import { schemaValidate } from "../middlewares/schema.validate.js";
import { signinSchema, signupSchema } from "../schemas/auth.schema.js";

export const authRouter = Router();

authRouter.post(
  "/signup",
  schemaValidate(signupSchema),
  singupValidate,
  signup
);
authRouter.post(
  "/signin",
  schemaValidate(signinSchema),
  singinValidate,
  signin
);
