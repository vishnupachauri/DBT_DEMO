
{% macro get_season(ts_col) %}

    CASE
        WHEN MONTH(TO_TIMESTAMP({{ ts_col }})) IN (12, 1, 2)
            THEN 'WINTER'
        WHEN MONTH(TO_TIMESTAMP({{ ts_col }})) IN (3, 4, 5)
            THEN 'SPRING'
        WHEN MONTH(TO_TIMESTAMP({{ ts_col }})) IN (6, 7, 8)
            THEN 'SUMMER'
        ELSE 'AUTUMN'
    END

{% endmacro%}


{% macro date_type(x) %}

CASE
    WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat','Sun')
        THEN 'WEEKEND'
    ELSE 'BUSINESS_DAY'
END 

{%  endmacro %}