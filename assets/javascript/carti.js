let baseURL = window.location.origin

let addSection
let addBookButton
let datalistAutori
let datalistGenuri

// maps for autori and genuri, as to show Nume instead of ID
let autoriMap = new Map()
let genuriMap = new Map()

// fire after all content has loaded
document.addEventListener('DOMContentLoaded', () => {

    // important elements from the DOM
    addSection = document.getElementById('add-book')
    addBookButton = document.getElementById('add-book-button')
    datalistAutori = document.getElementById('autori')
    datalistGenuri = document.getElementById('genuri')

    // listen for edit-book form submit event
    document.getElementById('add-book-form').addEventListener("submit", (e) => saveBook(e))
})

function addBook() {
    addSection.hidden = false
    addBookButton.hidden = true

    fetch(baseURL + '/api/autori', { method: 'GET' })
        .then((res) => res.json())
        .then((autori) => {
            autori.forEach((autor) => {
                autoriMap.set(autor.nume, autor.id)

                let option = document.createElement("option")
                option.value = autor.nume
                option.text = autor.nume
                datalistAutori.appendChild(option)
            })
        })

    fetch(baseURL + '/api/genuri', { method: 'GET' })
        .then((res) => res.json())
        .then((genuri) => {
            genuri.forEach((gen) => {
                genuriMap.set(gen.nume, gen.id)

                let option = document.createElement("option")
                option.value = gen.nume
                option.text = gen.nume
                datalistGenuri.appendChild(option)
            })
        })
}

function saveBook(e) {
    e.preventDefault()

    // find all form fields
    let titlu = document.getElementById("titlu").value
    let autor = document.getElementById("autor").value
    let gen = document.getElementById("gen").value
    let pagini = document.getElementById("pagini").value
    let data_publicarii = document.getElementById("data_publicarii").value

    let data = {
        titlu: titlu,
        autor: autoriMap.get(autor),
        gen: genuriMap.get(gen),
        pagini: Number(pagini),
        data_publicarii: data_publicarii
    }

    fetch(baseURL + '/api/carti', {
        method: 'POST',
        body: JSON.stringify(data)
    })
        .then((res) => res.json())
        .then((data) => {
            debugger
            window.location.pathname = '/carte/' + data.id;
        })
}
