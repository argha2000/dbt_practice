{%test generic_non_negative(model,column_name) -%}

select *
from {{model}}
where {{column_name}} < 0

{%endtest%}

-- now go to properties.yml to call the generic test