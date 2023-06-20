import IModelo from "./IModelo";

export default interface IVan {
  id: number;
  placa: string;
  quantidade_vagas: number;
  foto: string;
  descricao: string;
  modelo: IModelo;
}
