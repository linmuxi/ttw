DROP FUNCTION IF EXISTS queryChildrenCategoryInfo;

--根据‘商品分类ID’查询出所有子分类id，用“,”拼接。   
--调用例如：SELECT queryChildrenCategoryInfo('C16A8392492D11E5B93902004C4F4F50')
--SELECT * 
--  from t_goods_category 
-- where FIND_IN_SET(id, queryChildrenCategoryInfo('C16A8392492D11E5B93902004C4F4F50'));
CREATE FUNCTION `queryChildrenCategoryInfo` (goodsCategoryId VARCHAR(4000))
RETURNS VARCHAR(4000)
BEGIN
DECLARE sTemp VARCHAR(4000);
DECLARE sTempChd VARCHAR(4000);

SET sTemp = '';
SET sTempChd = goodsCategoryId;

WHILE sTempChd is not NULL DO
SET sTemp = CONCAT(sTemp,',',sTempChd);
SELECT group_concat(id) INTO sTempChd FROM t_goods_category WHERE FIND_IN_SET(PARENT_ID, sTempChd) > 0;
END WHILE;
return substring(sTemp, 2);
END;