namespace my.bookshop;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Books : cuid, managed {
    title       : String(100);
    author      : Association to Authors;
    stock       : Integer;
    gernre      : String(50);
    publishedAt : Date;
    pages       : Integer;
    price       : Decimal(10, 2);
    Chapters    : Association to many Chapters
                      on Chapters.book = $self;
                      // Add more fields as needed 
}

entity Authors : cuid, managed {
    name  : String(80);
    books : Association to many Books
                on books.author = $self;
}

entity Chapters : cuid, managed {
    title : String(100);
    book  : Association to Books;
}
