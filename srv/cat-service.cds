using { my.bookshop } from '../db/schema';


service CatalogService {
    entity Books   as projection on bookshop.Books; // projection of Books entity to expose it in the service
    entity Authors as projection on bookshop.Authors; // projection of Authors entity to expose it in the service

    action submitOrder(book: UUID, quantity: Integer) returns String; // action to submit an order for a book with a specified quantity

}
