class AnticiposController < ApplicationController
  def new
    @anticipo = Anticipo.new
    @arquitectos = Arquitecto.all
    @obras = Obra.all
  end

  def create
    @anticipo = Anticipo.new(anticipo_params)
    if @anticipo.save
      redirect_to home_index_path
    else
      render 'new'
    end
  end

  def generar_pdf
    @anticipo = Anticipo.find(params[:anticipo_id])
    
    respond_to do |format|
      format.pdf do
        pdf = generate_pdf(@anticipo)
        send_data pdf.render, filename: "#{sanitize_filename(@anticipo.obra.nombre)}", type: 'application/pdf', disposition: 'inline'
      end
    end
  end
  
  private
  
  def sanitize_filename(filename)
    # Remover caracteres no permitidos en nombres de archivo
    sanitized_filename = filename.gsub(/[^0-9A-Za-z.\-]/, '_')
    # Asegurarse de que el nombre de archivo tenga una extensión .pdf
    sanitized_filename += '.pdf' unless sanitized_filename.ends_with?('.pdf')
    sanitized_filename
  end
  

  private
    def anticipo_params
      params.require(:anticipo).permit(:arquitecto_id, :obra_id, :fecha, :cantidad, :concepto)
    end

    def generate_pdf(anticipo)
      Prawn::Document.new do
        font_size 16
    
        # Información del emisor
        text 'SERVICIOS ELECTRICOS Y MANTENIMIENTO', align: :center, style: :bold
        move_down 10
    
        text 'JOSE NATIVIDAD RETANA RODRIGUEZ', align: :center, style: :bold
        font_size 8
        text 'R.F.C. RENR-720328-FE5                                                          C.U.R.P. RERN720328HCMTDT02', align: :center, style: :bold
        text 'PRIV. MARGARITA MAZA DE JUAREZ #476                                                          ZONA CENTRO', align: :center, style: :bold
        text 'TEL 31 4 05 23 CEL. 044 312 31 9 31 05                                                 C.P. 28000 COLIMA, COL.', align: :center, style: :bold
        stroke_horizontal_rule
        move_down 60
        font_size 12
    
        # Fecha actual en español
        meses_espanol = {
          1 => 'enero',
          2 => 'febrero',
          3 => 'marzo',
          4 => 'abril',
          5 => 'mayo',
          6 => 'junio',
          7 => 'julio',
          8 => 'agosto',
          9 => 'septiembre',
          10 => 'octubre',
          11 => 'noviembre',
          12 => 'diciembre'
        }

        fecha_actual = Date.today.strftime(meses_espanol[Date.today.month].upcase + ' %d ' + ' DEL AÑO %Y')
        text "COLIMA, COL; #{fecha_actual}", align: :right
        move_down 50
    
        # Monto del anticipo
        formatted_text [
          { text: 'BUENO POR: ', styles: [:normal] },
          { text: "$#{anticipo.cantidad.to_s}.00", styles: [:bold] }
        ], align: :left
        move_down 50
    
        # Descripción del anticipo
        persona = anticipo.arquitecto.nombre.upcase
        formatted_text [
          { text: 'R E C I B I : DEL ', styles: [:normal] },
          { text: "#{persona}.-", styles: [:bold] }
        ], align: :right
        move_down 10
    
        def cantidad_en_palabras(cantidad)
          unidades = {
            0 => 'cero',
            1 => 'uno',
            2 => 'dos',
            3 => 'tres',
            4 => 'cuatro',
            5 => 'cinco',
            6 => 'seis',
            7 => 'siete',
            8 => 'ocho',
            9 => 'nueve',
            10 => 'diez',
            11 => 'once',
            12 => 'doce',
            13 => 'trece',
            14 => 'catorce',
            15 => 'quince',
            16 => 'dieciséis',
            17 => 'diecisiete',
            18 => 'dieciocho',
            19 => 'diecinueve'
          }
        
          decenas = {
            2 => 'veinte',
            3 => 'treinta',
            4 => 'cuarenta',
            5 => 'cincuenta',
            6 => 'sesenta',
            7 => 'setenta',
            8 => 'ochenta',
            9 => 'noventa'
          }
        
          centenas = {
            1 => 'ciento',
            2 => 'doscientos',
            3 => 'trescientos',
            4 => 'cuatrocientos',
            5 => 'quinientos',
            6 => 'seiscientos',
            7 => 'setecientos',
            8 => 'ochocientos',
            9 => 'novecientos'
          }
        
          miles = {
            1 => 'mil',
            2 => 'dos mil',
            3 => 'tres mil',
            4 => 'cuatro mil',
            5 => 'cinco mil',
            6 => 'seis mil',
            7 => 'siete mil',
            8 => 'ocho mil',
            9 => 'nueve mil'
          }
        
          if cantidad < 20
            unidades[cantidad]
          elsif cantidad < 100
            if cantidad % 10 == 0
              decenas[cantidad / 10]
            else
              "#{decenas[cantidad / 10]} y #{unidades[cantidad % 10]}"
            end
          elsif cantidad < 1000
            if cantidad % 100 == 0
              centenas[cantidad / 100]
            else
              "#{centenas[cantidad / 100]} #{cantidad_en_palabras(cantidad % 100)}"
            end
          elsif cantidad < 10000
            if cantidad % 1000 == 0
              miles[cantidad / 1000]
            else
              "#{miles[cantidad / 1000]} #{cantidad_en_palabras(cantidad % 1000)}"
            end
          end
        end

        text 'LA CANTIDAD DE : -                              -                              -                              -                              -', align: :left
        move_down 10
        cantidad_en_palabras = cantidad_en_palabras(anticipo.cantidad).upcase
        move_down 10
        text "$#{anticipo.cantidad.to_s}.00              -              -              (#{cantidad_en_palabras} PESOS OO/100 M.N.- - -)              -              -", style: :bold
        move_down 10
        text '-                              -                               -                              -                              -                              -', style: :bold
        move_down 50
        
        #Concepto
        text "POR EL CONCEPTO #{anticipo.concepto.upcase} REALIZADOS DE LA OBRA #{anticipo.obra.nombre.upcase}.", align: :left
        move_down 50
    
        # Firma y nombre del receptor
        text 'R E C I B I', align: :center, style: :bold
        move_down 10
    
        text '______________________________', align: :center
        text 'C. JOSE N. RETANA RODRIGUEZ', align: :center
      end
    end
    
    
end
