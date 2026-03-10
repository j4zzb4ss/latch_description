// Описание RS-триггера на SystemVeilog

// Var1
module rs (
    output logic q,
    input s, r
);
    
    // Начальное состояние
    initial q = 1'b1;
    
    // Комбинационная логика с запоминанием состояния
    always @(s or r or q) begin
        case ({s, r})
            2'b10: q = 1'b1;  // Set
            2'b01: q = 1'b0;  // Reset
            2'b00: q = q;     // Hold (сохраняем)
            2'b11: q = 1'b0;  // Reset в приоритете
        endcase
    end
endmodule

// Var2 (явно)
module rs_latch (
    output logic q,
    input s, r
);
    
    initial q = 1'b1;
    
    // Явно указываем, что это latch
    always_latch begin
        if ({s, r} == 2'b10)
            q = 1'b1;
        else if ({s, r} == 2'b01)
            q = 1'b0;
        else if ({s, r} == 2'b11)
            q = 1'b0;  
        // Иначе сохраняем (q = q) - неявно
    end
endmodule
