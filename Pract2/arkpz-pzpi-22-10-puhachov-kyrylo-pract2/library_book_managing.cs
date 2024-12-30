using System;
using System.Collections.Generic;

namespace LibraryManagement
{
    class Program
    {
        static void Main(string[] args)
        {
            Library library = new Library();
            library.AddBook("The Great Gatsby", "F. Scott Fitzgerald", 1925);
            library.AddBook("1984", "George Orwell", 1949);

            Console.WriteLine("Books in Library:");
            library.DisplayBooks();

            Console.WriteLine("\nUpdating a book...");
            library.UpdateBook(1, "Nineteen Eighty-Four", "George Orwell", 1949);
            library.DisplayBooks();
        }
    }

    class Library
    {
        private List<Book> books;

        public Library()
        {
            books = new List<Book>();
        }

        public void AddBook(string title, string author, int year)
        {
            books.Add(new Book { Title = title, Author = author, Year = year });
        }

        public void UpdateBook(int index, string title, string author, int year)
        {
            if (index >= 0 && index < books.Count)
            {
                books[index].Title = title;
                books[index].Author = author;
                books[index].Year = year;
            }
            else
            {
                Console.WriteLine("Invalid index");
            }
        }

        public void DisplayBooks()
        {
            foreach (var book in books)
            {
                Console.WriteLine($"Title: {book.Title}, Author: {book.Author}, Year: {book.Year}");
            }
        }
    }

    class Book
    {
        public string Title { get; set; }
        public string Author { get; set; }
        public int Year { get; set; }
    }
}
