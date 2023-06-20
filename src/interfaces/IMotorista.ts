import IVan from "./IVan";

export default interface IMotorista {
  id: number;
  email: string;
  nome: string;
  rg: string;
  cpf: string;
  telefone: string;
  data_nascimento: Date;
  senha: string;
  foto: string;
  data_inicio_carreira: Date;
  avaliacao: number;
  descricao: string;
  van: [IVan];
}
