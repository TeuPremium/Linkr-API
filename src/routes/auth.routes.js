import { Router } from "express";
import { signin, signup } from "../controllers/auth.controllers";
import { singinValidate, singupValidate } from "../middlewares/auth.validate";
import { schemaValidate } from "../middlewares/schema.validate";
import { signinSchema, signupSchema } from "../schemas/auth.schema";

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
