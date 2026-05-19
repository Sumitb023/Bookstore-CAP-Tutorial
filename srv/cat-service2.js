const cds = require('@sap/cds'); // Import the CDS library

module.exports = cds.service.impl(async function () { // Implement the CatalogService service

    //Exercise 5: Input Validation (Before Hook)    
    this.before('CREATE', 'Books', (req) => {         // Add a before hook for the CREATE operation on the Books entity
        const { stock } = req.data;                   // Extract the stock value from the request data
        if (stock < 0) {                              // Check if the stock value is negative            
            req.error(400, 'Stock cannot be negative');
        }
        if (!req.data.title || req.data.title.trim() === '') {
            req.error(400, 'Title is required');
        }
    });

    // Exercise 6: Computed Fields (After Hook)
    this.after('READ', 'Books', (books) => {
        books.forEach(book => {
            book.lowStock = book.stock < 10;
        });
    });

    // Exercise 7: Custom Actions - Submit Order
    // Implement the submitOrder action for the CatalogService
    this.on('submitOrder', async (req) => {
        const { book, quantity } = req.data;
        const bookRecord = await
            SELECT.one.from('my.bookshop.Books').where({ ID: book });
        if (!bookRecord) {
            req.error(404, 'Book not found');
        }
        if (bookRecord.stock < quantity) {
            req.error(400, 'Insufficient stock');
        }
        await UPDATE('my.bookshop.Books')
            .set({ stock: bookRecord.stock - quantity })
            .where({ ID: book });
        return; //Order; //placed for ${ quantity } copies;
    });
});

