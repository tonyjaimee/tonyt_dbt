{% macro drop_multiple_models(database,schema,table_names=[]) %}

{%- for table_name in table_names -%}
 {%- if not loop.first %} UNION ALL {% endif %}

{% set query %}
    DROP TABLE IF EXISTS {{database}}.{{schema}}.{{table_name}}
{% endset %}

{{log(query, info=true)}}
{% do run_query(query) %}

{%- endfor -%}

{% endmacro %}


