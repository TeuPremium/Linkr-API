// CREATE TABLE "posts" (
//     "id" SERIAL PRIMARY KEY,
//     "userId" INT NOT NULL REFERENCES "users"("id"),
//     "url" VARCHAR(255) NOT NULL,
//     "comment" VARCHAR(255) NOT NULL,
//     "createdAt" TIMESTAMP NOT NULL DEFAULT NOW(),
//     "updatedAt" TIMESTAMP
// );

import joi from "joi";

export const postSchema = joi.object({
    userId : joi.string().required(),
    url : joi.string().required(),
    comment : joi.string().required()
    // createdAt :joi.date(),
    // updatedAt :joi.date()
})