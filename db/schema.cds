namespace my.bookshop;

using {managed} from '@sap/cds/common';

entity Authors : managed {
    key ID    : UUID;
        name  : String(80);
        books : Association to many Books
                    on books.author = $self;
}
entity Books : managed {
// 
    key ID     : UUID;
        title  : String(100);
        author : Association to Authors;
        stock  : Integer;
}