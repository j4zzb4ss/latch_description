module d_latch (
    input  logic clk,  // Управляющий сигнал (Enable)
    input  logic d,    // Вход данных
    output logic q     // Выход
);
    
    always_latch begin
        if (clk) begin
            q = d;     // Прозрачный режим
        end
        // else q сохраняет значение (неявно)
    end
    
endmodule
