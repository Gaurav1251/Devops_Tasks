                    
FROM nginx:latest

RUN apt-get update && \
    apt-get install -y unzip wget

RUN wget -O /usr/share/nginx/html/restoran.zip https://www.free-css.com/assets/files/free-css-templates/download/page290/restoran.zip \
    && unzip /usr/share/nginx/html/restoran.zip -d /usr/share/nginx/html/

WORKDIR /usr/share/nginx/html/
RUN mv bootstrap-restaurant-template/* ./

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
