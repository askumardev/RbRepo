data = [2, 3, 1]
data2 = ['a', 'c', 'd', 'b']
for(let i = 0; i < data.length; i++){
  console.log(data[i])
} //O(n) if one loop
// ---------------------------------------------
for(let j = 0; j < data2.length; j++){
  console.log(data2[j])
} //O(n + m) since 2 loops
// ---------------------------------------------
for(let i = 0; i < data.length; i++){
  for(let j = 0; j < data2.length; j++){
    console.log(data[i] + data2[j])
  }
} //O(n * m) since nested loops
// ---------------------------------------------
for(let i = 0; i < data.length; i++){
  for(let j = 0; j < data.length; j++){
    console.log(data[i] + data[j])
  }
} //O(n ^ 2) since nested loops

// node scripts/sample.js