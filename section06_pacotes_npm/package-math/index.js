import validarCpf from 'validar-cpf'

export function multiply(a, b) {
  return a * b
}

export function sum(a, b) {
  return a + b
}

export function validateCPFNumber(cpf) {
  return validarCpf(cpf)
}
