# 🛒 Projeto SQL — Banco de Dados de E‑commerce  
Desafio de Projeto — DIO / Klabin - Excel e Power BI Dashboards 2026

Este repositório contém o desenvolvimento completo de um banco de dados relacional para um cenário de **e‑commerce**, incluindo:

- Modelo lógico refinado  
- Script SQL de criação do banco  
- Inserção de dados para testes  
- Consultas SQL simples e avançadas  
- Regras de negócio aplicadas ao modelo  

O objetivo é demonstrar domínio em modelagem de dados, normalização, criação de tabelas, relacionamentos e consultas SQL utilizando MySQL.

---

## 🧱 **Modelo Lógico (Descrição)**

### **Entidades principais**
- **Clients**: armazena dados básicos do cliente e seu tipo (PF/PJ)  
- **clientPF / clientPJ**: especializações contendo CPF ou CNPJ  
- **Product**: catálogo de produtos  
- **Supplier**: fornecedores  
- **Seller**: vendedores  
- **Orders**: pedidos realizados  
- **Delivery**: rastreamento e status da entrega  
- **Payments**: formas de pagamento do cliente  
- **ProductOrder**: itens dos pedidos  
- **ProductSupplier**: fornecedores de cada produto  
- **ProductSeller**: vendedores de cada produto  
- **ProductStorage / StorageLocation**: controle de estoque  

### **Principais Regras**
- Cliente PF tem CPF único  
- Cliente PJ tem CNPJ único  
- Um cliente pode ter várias formas de pagamento  
- Um pedido pode ter vários produtos  
- Um produto pode ter vários fornecedores e vendedores  
- Entrega vinculada a um pedido  

---

## 🗄 **Script SQL Completo**

O script completo de criação do banco, tabelas e inserção de dados está no arquivo:

