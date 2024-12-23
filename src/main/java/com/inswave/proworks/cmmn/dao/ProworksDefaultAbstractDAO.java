package com.inswave.proworks.cmmn.dao;

import javax.annotation.Resource;

import com.inswave.elfw.db.ElAbstractMybatisDAO;

import org.apache.ibatis.session.SqlSessionFactory;

/**  
 * @subject		: プロジェクトのデフォルトDAOの上位クラス - 各業務DAOで継承して使用される(デフォルトデータソースを使用する場合) 
 * @description : プロジェクトのデフォルトDAOの上位クラス - 各業務DAOで継承して使用される(デフォルトデータソースを使用する場合) 
 * @author		: 開発チーム
 * @since 		: 2024/12/20
 * @modification
 * ===========================================================
 * DATE				AUTHOR				NOTE
 * ===========================================================
 * 2024/12/20		サンプル開発チーム			最初に作成
 * 
 */
public class ProworksDefaultAbstractDAO extends ElAbstractMybatisDAO {
	
	/**
	 *  デフォルトデータソースのSQLMAPをロードするためのセッター 
	 * @param sqlMapClient
	 */
	@Resource(name = "db1SqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory(sqlSessionFactory);
    }
}
