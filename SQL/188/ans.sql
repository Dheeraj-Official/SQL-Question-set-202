USE Carnival;
GO

WITH MenuBreadcrumbs AS
(
    -- anchor: top-level menus (no parent)
    SELECT
        MenuID,
        ParentMenuID,
        MenuName,
        CAST(MenuName AS VARCHAR(MAX)) AS Breadcrumb,
        0 AS [Level]
    FROM dbo.tblMenu
    WHERE ParentMenuID IS NULL

    UNION ALL

    -- recursive part: children, appending their name to the parent's breadcrumb
    SELECT
        m.MenuID,
        m.ParentMenuID,
        m.MenuName,
        CAST(mb.Breadcrumb + ' > ' + m.MenuName AS VARCHAR(MAX)) AS Breadcrumb,
        mb.Level + 1
    FROM dbo.tblMenu m
    JOIN MenuBreadcrumbs mb ON m.ParentMenuID = mb.MenuID
)


SELECT
    MenuID,
    MenuName,
    Breadcrumb,
    [Level]
FROM MenuBreadcrumbs
ORDER BY Breadcrumb;