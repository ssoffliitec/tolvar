class Search
 def initialize(page, page_size, keywords)
  @page = page
  @page_size = page_size
  @offset = page_size * page
  @keywords = keywords
 end


 def brands_by_name
    if @keywords.present?
     brands = Marca.where(name_condition).order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Marca.where(name_condition).count
    else
     brands = Marca.order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Marca.count
    end
   
    return brands, number_of_pages
  end


  def categories_by_name
   if @keywords.present?
     category = Category.where(name_condition).order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Category.where(name_condition).count
   else
     categories = Category.order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Category.count
   end
 
   return categories, number_of_pages
  end

  def units_by_name
   if @keywords.present?
     units = Unit.where(name_condition).order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Unit.where(name_condition).count
   else
     units = Unit.order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Unit.count
   end
 
   return units, number_of_pages
  end

  def towns_by_name
    if @keywords.present?
      towns = Town.where(name_condition).order(:name).offset(@offset).limit(@page_size)
      @number_of_records = Town.where(name_condition).count
    else
      towns = Town.order(:name).offset(@offset).limit(@page_size)
      @number_of_records = Town.count
    end
  
    return towns, number_of_pages
  end

  def items_by_description
    if @keywords.present?
        items = Item.where(description_condition).order(:description).offset(@offset).limit(@page_size)
        @number_of_records = Item.where(description_condition).count
      else
        items = Item.order(:description).offset(@offset).limit(@page_size)
        @number_of_records = Item.count
      end
      
      return items, number_of_pages
  end

  def recordatorios_by_name
      if @keywords.present?
     recordatorios = Recordatorio.where(name_condition).order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Recordatorio.where(name_condition).count
    else
     recordatorios = Recordatorio.order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Recordatorio.count
    end
   
    return recordatorios, number_of_pages
  end

  def customers_by_name
      if @keywords.present?
     customers = Customer.where(name_condition).order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Customer.where(name_condition).count
    else
     customers = Customer.order(:name).offset(@offset).limit(@page_size)
     @number_of_records = Customer.count
    end
   
    return customers, number_of_pages
  end

  def sales
		if @keywords.present?
		    sales = Sale.where(sale_condition).order(number: :desc).offset(@offset).limit(@page_size)
		    @number_of_records = Item.where(description_condition).count
	    else
		    sales = Sale.where(state: "confirmed").order(number: :desc).offset(@offset).limit(@page_size)
			@number_of_records = Sale.where(state: "confirmed").count
	    end

		return sales, number_of_pages
  end

 private

  def name_condition
    name_condition = "unaccent(lower(name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
  end

  def sale_condition
		number_condition = "number = #{@keywords.to_i} and state = 1"
  end

  def description_condition
    description_condition = "unaccent(lower(description)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
  end

  def number_of_pages
  number_of_pages = (@number_of_records % @page_size) == 0 ? 
  @number_of_records / @page_size - 1 : @number_of_records / @page_size
 end

end