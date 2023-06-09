arquitecto = Arquitecto.create(nombre: "Matia di Frena")

obras = [
  { nombre: "Akama", estado: "Alta" },
  { nombre: "Amadar", estado: "Alta" },
  { nombre: "Amaite", estado: "Alta" },
  { nombre: "Amanak", estado: "Alta" },
  { nombre: "Amankay", estado: "Alta" },
  { nombre: "Bakal", estado: "Alta" },
  { nombre: "Cantera", estado: "Alta" },
  { nombre: "Cañada", estado: "Alta" },
  { nombre: "Chepe Baño", estado: "Alta" },
  { nombre: "Cochera Cortez", estado: "Alta" },
  { nombre: "Cochera Kaleth", estado: "Alta" },
  { nombre: "Cochera Rodriguez", estado: "Alta" },
  { nombre: "Esmeralda", estado: "Alta" },
  { nombre: "Este", estado: "Alta" },
  { nombre: "Jonathan", estado: "Alta" },
  { nombre: "Kabul", estado: "Alta" },
  { nombre: "Kaleth", estado: "Alta" },
  { nombre: "Kerany", estado: "Alta" },
  { nombre: "Macau", estado: "Alta" },
  { nombre: "Makay", estado: "Alta" },
  { nombre: "Manak", estado: "Alta" },
  { nombre: "Mara", estado: "Alta" },
  { nombre: "Mazati", estado: "Alta" },
  { nombre: "Mila", estado: "Alta" },
  { nombre: "Nazoly", estado: "Alta" },
  { nombre: "Nogueras", estado: "Alta" },
  { nombre: "Nomah", estado: "Alta" },
  { nombre: "Oficina", estado: "Alta" },
  { nombre: "Ohana", estado: "Alta" },
  { nombre: "Pagos contratos cfe", estado: "Alta" },
  { nombre: "Parque Royal", estado: "Alta" },
  { nombre: "Real Santa Barbara", estado: "Alta" },
  { nombre: "Retorno Primavera", estado: "Alta" },
  { nombre: "Rosa Morada", estado: "Alta" },
  { nombre: "San Ramon", estado: "Alta" },
  { nombre: "Seye", estado: "Alta" },
  { nombre: "Sibu", estado: "Alta" },
  { nombre: "Terraza Cortez", estado: "Alta" },
  { nombre: "Terraza Rodriguez", estado: "Alta" },
  { nombre: "Tierra Alta", estado: "Alta" },
  { nombre: "Zazil", estado: "Alta" },
  { nombre: "Zenzy", estado: "Alta" }
]

obras.each do |obra|
  Obra.create(nombre: obra[:nombre], arquitecto_id: arquitecto.id, estado: obra[:estado])
end
