require 'rails_helper'

describe 'Usuário vê modelos de produtos' do 

    it 'a partir da home' do

        visit(root_path)
        within ('nav') do
            click_on('Modelos de Produtos')
        end

        expect(current_path).to eq(product_models_path)

    end

    it 'com sucesso' do
        @supplier = Supplier.create!(corporation_name: 'Samsung Brasil LTDA', brand_name: 'Samsung', registration_number: '12.345.678/1000-10',
            address: 'Rua Progresso, 2548', city: 'Blumenau', state: 'Santa Catarina', email: 'inoxbrasilcontato@inox.com.br')

        ProductModel.create!(name: 'TV 32in', weight: 2000 , width: 70, height: 45, depth: 10, sku:'TV32I-SAMSU-XPTO90', supplier: @supplier)
        ProductModel.create!(name: 'Soundbar 7.1', weight: 4000 , width: 85, height: 15, depth: 15, sku:'SOU71-SAMSU-NOIZ90', supplier: @supplier)

        visit(root_path)
        within ('nav') do
            click_on('Modelos de Produtos')
        end

        expect(current_path).to eq(product_models_path)
        expect(page).to have_content('TV 32in')
        expect(page).to have_content('TV32I-SAMSU-XPTO90')
        expect(page).to have_content('Samsung')
        expect(page).to have_content('Soundbar 7.1')
        expect(page).to have_content('SOU71-SAMSU-NOIZ90')
        expect(page).to have_content('Samsung')
    end
    
    it 'e não há produtos cadastrados' do

        visit(root_path)
        within ('nav') do
            click_on('Modelos de Produtos')
        end

        expect(page).to have_content('Não há modelos de produtos cadastrados!')
        

    end
end