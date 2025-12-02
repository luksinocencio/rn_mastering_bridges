import { multiply, sum, validateCPFNumber } from './index.js'

console.log('multiply', multiply(5, 10))
console.log('sum', sum(10, 10))
console.log('validateCPFNumber', validateCPFNumber('1'))
console.log('validateCPFNumber', validateCPFNumber('47437994143'))
console.log('validateCPFNumber', validateCPFNumber('474.379.941-43'))
