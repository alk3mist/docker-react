# BUILD PHASE
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# RUN PHASE
FROM nginx
# we care only about /app/build folder
# Nginx has it's own command to start
COPY --from=builder /app/build /usr/share/nginx/html
