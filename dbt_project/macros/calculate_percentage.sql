{% macro calculate_percentage(col1,col2) %}
    CASE 
        WHEN {{ col2 }} = 0 THEN 0
        ELSE ({{ col1 }} / {{ col2 }}) * 100
    END
{% endmacro %}