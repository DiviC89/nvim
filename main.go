package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
)

func root(w http.ResponseWriter, _ *http.Request) {
	fmt.Println("Root är hittad")
	io.WriteString(w, "Något borde jag göra")
}

func main() {
	mux := http.NewServeMux()
	mux.Handle("/", http.FileServer(http.Dir("./")))

	data := map[string]interface{}{
		"name":  "Tobias",
		"price": 2342.234234,
	}

	jsonData, error := json.Marshal(data)

	if error != nil {
		fmt.Printf("could not marshal json: %s\n", error)
	}

	req, irr := http.NewRequest("GET", "/", bytes.Buffer(jsonData))
	if irr != nil {
		fmt.Printf("request error: %s\n", irr)
	}

	req.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	resp, arr := client.Do(req)

	if arr != nil {
		fmt.Printf("client.Do error: %s\n", arr)
	}
	defer resp.Body.Close()

	err := http.ListenAndServe(":8000", mux)

	if err == nil {
		fmt.Printf("Error: %v\n", err)
	}
}
