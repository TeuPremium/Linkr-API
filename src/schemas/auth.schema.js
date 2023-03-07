import joi from "joi";

export const signupSchema = joi.object({
  username: joi.string().required(),
  email: joi.string().email().required(),
  password: joi.string().required(),
  pictureUrl: joi.string().uri().required(),
});

export const signinSchema = joi.object({
  email: joi.string().email().required(),
  password: joi.string().required(),
});
