import { Request, Response } from "express";
import IMotorista from "../interfaces/IMotorista";
import { prismaClient } from "../lib/db";
import { hashSync } from "bcryptjs";
import IVan from "../interfaces/IVan";

export class NameClass {
  async post(request: Request, response: Response) {
    try {
      let driver: IMotorista,
        cpf = request.body;

      if (driver) {
        const rs = await prismaClient.motorista.create({
          data: {
            email: driver.email,
            nome: driver.nome,
            rg: driver.rg,
            cpf: driver.cpf,
            telefone: driver.telefone,
            data_nascimento: driver.data_nascimento,
            data_inicio_carreira: driver.data_inicio_carreira,
            foto: driver.foto,
            senha: hashSync(driver.senha, 8),
            avaliacao: 0.0,
            descricao: driver.descricao,
            van: {
              create: {
                placa: driver.van[0].placa,
                quantidade_vagas: driver.van[0].quantidade_vagas,
                foto: driver.van[0].foto,
                descricao: driver.van[0].descricao,
                modelo: {
                  connectOrCreate: {
                    where: {
                      modelo: driver.van[0].modelo.modelo,
                    },
                    create: {
                      modelo: driver.van[0].modelo.modelo,
                    },
                  },
                },
              },
            },
          },
        });
      }

      return response.json();
    } catch (error) {
      response.json(error);
    }
  }
}
