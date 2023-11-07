FROM node
WORKDIR /opt/blog
COPY . .
RUN npm install && npm install shelljs -g
EXPOSE 3000
CMD ["npm", "start"]
