package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello, Poke Quick!")
}

func main() {
    fmt.Println("Hello, Poke Quick!")
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8080", nil)
}
