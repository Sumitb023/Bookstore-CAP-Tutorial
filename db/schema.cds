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
}

entity Authors : cuid, managed {
    name  : String(80);
    books : Association to many Books
                on books.author = $self;
                //Another way to define the association is by using the "via" keyword:
                //books : Association to many Books via author;
                //In this case, the association is defined via the "author" field in the Books entity, which is an association to the Authors entity. The "via" keyword allows you to specify the field that should be used to establish the association between the two entities.
}

entity Chapters : cuid, managed {
    title : String(100);
    book  : Association to Books;
}
