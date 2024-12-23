/*
DELETE FROM EL_APP   WHERE APP_ID = 'ElService';

DELETE FROM EL_SVC_MENU WHERE APP_ID = 'ElService';

DELETE FROM EL_APP_CMT_DEPL   WHERE APP_ID = 'ElService';

DELETE FROM EL_APP_CMT_DEPL_PARAM   WHERE APP_ID = 'ElService';

DELETE FROM EL_RSC   WHERE APP_ID = 'ElService';

DELETE FROM EL_NOTIFY WHERE APP_ID = 'ElService';

DELETE FROM EL_SVC_AUTH WHERE APP_ID = 'ElService';

DELETE FROM EL_SVC_CTR WHERE APP_ID = 'ElService';

DELETE FROM EL_SVC_GROUP_TREE WHERE APP_ID = 'ElService';

DELETE FROM EL_SVC_GROUP WHERE APP_ID = 'ElService';

DELETE FROM EL_SVC WHERE APP_ID = 'ElService';

DELETE FROM EL_SYS_PROP WHERE APP_ID = 'ElService';

DELETE FROM EL_MENU_AUTH WHERE APP_ID = 'ElService';

DELETE FROM EL_USER WHERE APP_ID = 'ElService';

DELETE FROM EL_USER_GROUP WHERE APP_ID = 'ElService';

DELETE FROM EL_MENU WHERE APP_ID = 'ElService';

DELETE FROM EL_MENU_GROUP WHERE APP_ID = 'ElService';

COMMIT;
 */


/* 下記のEL_APP情報はシステムの状況に合わせて修正が必要です */  
Insert into EL_APP
   (APP_ID, APP_NAME, APP_ORDER, JAVA_HOME, JAVAC_OPTION, 
    APP_JAR_DIR, APP_CLASS_PATH)
 Values
   ('ElService', 'ElService_WebApplication', 100, '/opt/jdk-11.0.15-ojdkbuild-linux-x64', '-encoding UTF-8 -g', 
    '/home/proworks/context/ElService/WEB-INF/lib:/home/proworks/context/ElService/WEB-INF/lib-provided', '/home/proworks/context/ElService/WEB-INF/classes');
   
/* 下記のEL_APP_CMT_DEPL情報はシステムの状況に合わせて修正が必要です - 最低1つの基本的なCopyデプロイが必要です */  
Insert into EL_APP_CMT_DEPL
   (APP_ID, APP_DEPL_ID, APP_DEPL_GBN, APP_DEPL_NAME, APP_DEPL_CLASS, 
    APP_DEPL_YN, DEPL_SRC_PATH, DEPL_RES_PATH, DEPL_CLS_PATH, DEPL_WEB_PATH)
 Values
   ('ElService', 'ElService_node1', 'DEV', 'ElService_WebApplication_基本ノード', 'com.inswave.elfw.deploy.DefaultDeployCopyAdapter', 
    'Y', '/home/proworks/resources/ElService', '/home/proworks/context/ElService/WEB-INF/classes', '/home/proworks/context/ElService/WEB-INF/classes', '/home/proworks/context/ElService');
    
   
COMMIT;

Insert into EL_NOTIFY
   (APP_ID, SERVER_NO, NOTIFY_BASE_URL, USED_YN, SERVER_ID)
 Values
   ('ElService', 1, 'http://localhost:8080/ElService', 'Y', 'ElService');



Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'SERVER_MODE', 'サーバーモード', 'DEV', 'サーバーモード(DEV, TST, RUN) - 開発モードはValidatorの即時反映、F/W用サーバーモード、業務用は新規作成が推奨', 100);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'CONTROLLER_VALIDATOR_USE_YN', 'Validatorの使用有無', 'Y', 'Validatorの使用有無 ( Y / N )', 300);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'APPLICATION_LOG_FACTORY_IMPL', 'Appログの実装クラス', 'com.inswave.elfw.log.DefaultApplicationLogFactoryImpl', 'LogFactory実装体 ( カスタマイズ可能 )');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'APPLICATION_LOG_DIR', 'Appログの保存場所', '/home/proworks/logs/ElService', 'ログファイルの場所', 210);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'APPLICATION_LOG_SEND_TARGET_LOGGER_NAME', 'Appログを外部に送る名前', 'elfw.appLogger', 'AppLogを外部Appenderに送る名前 - 存在しない場合は送らない');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'APPLICATION_LOG_APPEND_LOGGERS', 'APPログに追加する外部ロガー名', '取得する外部ロガー (,で区切る)- 外部ロガーの設定を強制的に変更する場合はロガー名の後にレベルを明記する。 ex) java.sql:ERROR');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'LOG4J_LOADING_BASE_FILE', '読み込むlog4jファイル名', 'log4j.xml', 'ロードするlog4.xmlファイル - クラスパスに直接存在する必要がある');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'USER_HEADER_CLASS_NAME', 'ユーザーヘッダー実装クラス名', 'com.inswave.proworks.cmmn.ProworksUserHeader', 'ユーザーヘッダークラス名');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'LOGIN_ADAPTER_CLASS_NAME', 'ログイン アダプター実装クラス名', 'com.inswave.proworks.cmmn.ProworksLoginAdapter', 'ログイン アダプタークラス名');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'SESSION_ADAPTER_CLASS_NAME', 'セッション アダプター実装クラス名', 'com.inswave.elfw.session.HttpSessionAdapter', 'セッションのストレージ アダプタークラス名');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'SESSION_DATA_ADAPTER_CLASS_NAME', 'セッションデータ アダプター実装クラス名', 'com.inswave.proworks.cmmn.ProworksSessionDataAdapter', 'セッションに保存するデータ アダプタークラス名');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'HEADER_SET_ADAPTER_CLASS_NAME', 'ヘッダー設定 アダプター実装クラス名', 'com.inswave.proworks.cmmn.ProworksUserHeaderSetAdapter', 'ヘッダー設定 アダプタークラス名');

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'OUTPUT_XML_DATA_SERVICE_YN', 'XML 入出力使用有無', 'Y', 'XML Output サービス全体の基本設定', 330);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'OUTPUT_JSON_DATA_SERVICE_YN', 'JSON 入出力使用有無', 'Y', 'JSON Output サービス全体の基本設定', 340);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'OUTPUT_FLD_DATA_SERVICE_YN', 'FLD 入出力使用有無', 'Y', 'FLD 入出力使用有無', 350);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'INPUT_XML_RESOLVER_ADAPTER_CLASS_NAME', 'XML 入出力実装クラス名', 'com.inswave.elfw.resolver.DefaultXmlAgumentResolver2Adapter', '存在する場合、XML OUT サービス時にInputをHTTP Requestではなくxml データとして受け取る。(reqeustパラメータのdataフィールドに文字列で受け取る)');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'INPUT_JSON_RESOLVER_ADAPTER_CLASS_NAME', 'JSON 入出力実装クラス名', 'com.inswave.elfw.resolver.DefaultJsonAgumentResolverAdapter', '存在する場合、JSON OUT サービス時にInputをHTTP Requestではなくjson データとして受け取る。(reqeustパラメータのdataフィールドに文字列で受け取る)');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'AUTH_CHECK_YN', '全体の権限チェック使用有無', 'N', '全てのコントローラーで権限チェック', 310);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'SESSION_CHECK_YN', '全体のセッションチェック使用有無', 'Y', '全てのコントローラーでセッションチェック', 320);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'FRAMEWORK_FORCE_SESSION_CHECK_YN', 'フレームワークの強制セッションチェック有無', 'Y', 'フレームワークの強制セッションチェック有無', 321);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'AUTH_ADAPTER_CLASS_NAME', '権限チェック実装クラス名', 'com.inswave.elfw.auth.DefaultAuthAdapter', '権限チェックを担当するアダプタークラス名');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'SCRN_AUTH_ADAPTER_CLASS_NAME', '画面権限チェック実装クラス名', 'com.inswave.elfw.auth.DefaultScrnAuthAdapter', '画面権限チェックを担当するアダプタークラス名');

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'SCRN_ID_ADAPTER_CLASS_NAME', '画面ID実装クラス名', 'com.inswave.elfw.auth.DefaultScrnIdAdapter', '画面IDを担当するアダプタークラス名');以下は、韓国語の注釈を日本語に翻訳したXMLコードです。

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'APPLICATION_LOG_LEVEL', 'アプリログレベル', 'DEBUG', 'ログレベル(アプリログのみ設定) - 外部ロガーの場合は外部ロガーの設定に従う。', 230);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'SPRING_CONFIG_BASE_CLASSPATH', 'Springの設定ファイルの場所', 'inswave/spring', 'Springの設定ファイルの場所(Validator Managerで使用)');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'SQL_LOG_LINE_FEED_YN', 'SQLログの改行使用有無', 'Y', 'SQLログの改行処理有無', 250);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'SQL_WRITE_LOG_LEVEL', 'SQLを記録するログレベル', 'DEBUG', 'SQLを記録するログレベル(DEBUG, OFF) - デフォルトはDEBUG', 240);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'APPLICATION_LOG_WRITE_YN', 'ログ記録有無', 'Y', 
    'ログ記録有無(Y/N) - デフォルトはY', 235);   

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'SYSTEM_HANDLE_CLASS_NAME', 'システムの前/後処理実装クラス名', 'com.inswave.proworks.cmmn.ProworksSystemHandleAdapter', 'システムの前/後処理を処理するアダプタークラス名');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'SERVICE_USER_CONTROL_CLASS_NAME', 'サービス制御実装クラス名', 'com.inswave.elfw.intercept.service.DefaultElServiceUserControlAdapter', 'ユーザー定義サービス制御アダプタークラス名');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'TEST_SERVICE_RUN_YN', 'テスト用Testサービスの動作有無', 'Y', 'テスト用Testサービスの動作有無(Y/N)');
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'INPUT_XFORM_RESOLVER_ADAPTER_CLASS_NAME', 'XFORM入力実装クラス名', 'X-Internet入力アダプター');

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'SCM_CLIENT_CLASS_NAME', '構成管理連携実装クラス名', 'com.inswave.elfw.scm.SvnClientHandleAdapter', '構成管理連携アダプター', 410);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'PROJECT_SOURCE_SVN_URL', '構成管理SVN URL', '', '構成管理SVN URL(Javaソースがある場所まで指定する)、指定された場所にファイルが保存され、これはソース分析用のプロジェクトソースの場所として使用される。', 420);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'PROJECT_SOURCE_SVN_USER', '構成管理SVN USER', '', '構成管理SVN USER', 430);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'PROJECT_SOURCE_SVN_PASS', '構成管理SVNパスワード', '', '構成管理SVNパスワード', 440);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC,SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'APPLICATION_LOG_SIZE', 'アプリログサイズ', '100M', 'ログファイルサイズ', 245);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'SCRN_AUTH_CACHE_SIZE', '画面権限情報キャッシュサイズ', '10000', '画面権限情報キャッシュサイズ', 300);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'DEFAULT_LOG_FORMATTER_NAME', 'ログフォーマッター実装クラス名', 'com.inswave.elfw.log.DefaultAppFormatter', 
    'ログフォーマッター実装クラス名 - AppLogFormatter継承して実装');

/* Add 20190608 */
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'IMAGE_LOG_USE_YN', '画像ログ使用有無', 'N', 
    '画像ログ使用有無', 300);INSERT INTO EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'IMAGE_LOG_QUEUE_SIZE', '画像ログキューサイズ', '10', 
    '画像ログキューサイズ', 301);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'IMAGE_LOG_TIMER_SEC', '画像ログタイマー時間(秒)', '30', 
    '画像ログタイマー時間(秒)', 302);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'IMAGE_LOG_QUEUE_WARN_SIZE', '画像ログキュー警告サイズ', '0', 
    '画像ログキュー警告サイズ - 0の場合は動作しない', 303);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'IMAGE_LOG_QUEUE_ERROR_SIZE', '画像ログキューエラーサイズ', '0', 
    '画像ログキューエラーサイズ - 0の場合は動作しない', 304);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'IMAGE_LOG_PROCESS_CLS_NAME', '画像ログ実装クラス', 'com.inswave.elfw.log.img.DefaultDBImageLogProcess', 
    '画像ログ実装クラス', 305);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'IMAGE_LOGGER_CLS_NAME', '画像ロガー実装クラス', 'com.inswave.elfw.log.img.DefaultDBImageLogger', 
    '画像ロガー実装クラス - ElAbstractDBImageLogger を継承して実装する必要がある', 306);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'CONTROLLER_TIME_OUT', 'Controllerタイムアウト設定 ms', '0', 
    'Controllerタイムアウト設定 単位 : ms  (-1の場合は動作しない) ', 260);
       
INSERT INTO EL_SYS_PROP 
  ( APP_ID ,SYS_GROUP_ID ,SYS_KEY ,SYS_SUB ,SYS_VAL ,SYS_DESC ,SORT_SEQ )  
values  
  ( 'ElService' ,'EL_CORE_PROP' ,'CRYPTO_CASS_NAME' ,'暗号化実装クラス' ,'' ,'暗号化実装クラスはフレームワークの抽象クラスであるElAbstractCryptoを継承し、getEncrypt、getDecryptメソッドを実装する必要がある' ,270 ) ;

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'FRAMEWORK_LOGIN_CHECK_YN', 'フレームワークアカウントIDログイン確認', 'N', 'フレームワークアカウントIDログイン確認 ( Y/N ), Nに設定した場合、権限確認がfalseになる', 310);
   
COMMIT;
/* Add 20190608 */

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_AUTH_CD', 'A', '全権限', '全権限', '全権限', 10);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_AUTH_CD', 'P', '出力権限', '出力', '出力権限', 30);
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_AUTH_CD', 'R', '読取権限', '読取', '読取権限', 20);
COMMIT;


/* Add 20200312 */
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'EL_HEALTH_DB_CHECK_QUERY', 'DBヘルス確認クエリ', '', 
    'DBヘルス確認クエリ - Oracle : SELECT 1 as msg FROM DUAL', 500);
COMMIT;



Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'FLD_SERVICE_DB_BASE_YN', 'EL_SVC フィールド追加に伴う基本オプション', 'Y', 
    'EL_SVC テーブルフィールド追加に伴うオプション基本設定 - 新規サイト適用必須');
COMMIT;    

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'EL_SERVICE_RETURN_VO_USED_YN', 'コントローラーの戻りVOサポート有無', 'Y', 
    'コントローラーの戻りVOサポート有無 ');
COMMIT;

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'OPEN_API_HANDLE_CLASS_NAME', 'オープンAPI Handle実装クラス', '', 
    'オープンAPI Handle実装クラス', 311);

Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'EL_SERVI以下は、韓国語の注釈を日本語に翻訳したXMLコードです。

INSERT INTO EL_SYS_PROP  ( APP_ID ,SYS_GROUP_ID ,SYS_KEY ,SYS_SUB ,SYS_VAL ,SYS_DESC ,SORT_SEQ )  
values  
( 'ElService' ,'EL_CORE_PROP' ,'SVC_INFO_BASE_URL' ,'サービス入出力情報のためのBase Url' 
,'http://localhost:8080/ElService' ,'サービス入出力情報のためのBase Url' ,300 ) ;
COMMIT;


Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'EL_HTTP_BODY_ALWAYS', 'HttpBodyモードのみ常に使用', 'Y', 
    'HttpBodyモードのみ常に使用', 390);
 COMMIT;
 

 Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC)
 Values
   ('ElService', 'EL_CORE_PROP', 'QUERY_TIMEOUT_FOR_SVC_TIMEOUT', 'サービスタイムアウトのためのクエリタイムアウト設定の有無', 'N', 
    'サービスタイムアウトのためのクエリタイムアウト設定の有無');
 COMMIT;

/* 20210630 */
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'EL_JSON_PROPERTY_NAMING_STRATEGY_CLASS_NAME', 'UIリクエスト/レスポンスのJson処理時にVOバインディング処理のためのルールを適用するためのクラス名の実装体', 'com.inswave.elfw.databind.DefaultPropertyNamingStrategy', 
    'Jsonの変換フィールド名称処理クラス名 Annotation使用 - com.inswave.elfw.databind.DefaultPropertyNamingStrategy', 350);


Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'EL_INPUT_JSON_FAIL_ON_UNKNOWN_PROPERTIES_YN', 'UIのJsonリクエスト時にVOに定義されていない項目のエラーチェックの有無', 'N', 
    'UIのJsonリクエスト時にVOに定義されていない項目のエラーチェックの有無', 350);

/* 20220224 */
Insert into EL_SYS_PROP
   (APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, 
    SYS_DESC, SORT_SEQ)
 Values
   ('ElService', 'EL_CORE_PROP', 'EL_CTRL_NO_PARAM_NORMAL_DATA_YN', 'Controllerのパラメータがない場合の正常フォーマットでのデータ処理の有無', 'N', 
    'Controllerのパラメータがない場合の正常フォーマットでのデータ処理の有無 : デフォルト値がNの場合、データ部のみ返される - 以前のサイトとの互換性', 400);
    
Insert into EL_SYS_PROP
	(APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
 Values
 	('ElService', 'EL_CORE_PROP', 'REGSIST_SERVICE_CHECK_YN', 'サービスチェック使用の有無', 'Y', 'サービスチェック使用の有無', 501);
 	
/* 20231115 *//*
INSERT INTO EL_SYS_PROP
(APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
VALUES('ElService', 'EL_CORE_PROP', 'KAFKA_ADAPTER_CLASS_NAME', 'Kafkaアダプタの実装クラス名', 'com.inswave.elfw.kafka.adapter.DefaultKafkaHandlerAdapter', 'Kafkaアダプタクラス名', NULL);

INSERT INTO EL_SYS_PROP
(APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
VALUES('ElService', 'EL_CORE_PROP', 'KAFKA_BROCKING_TIME_OUT', 'Kafkaブロッキングタイムアウト時間', '10', 'Kafkaブローカータイムアウト時間(秒)', NULL);

INSERT INTO EL_SYS_PROP
(APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
VALUES('ElService', 'EL_CORE_PROP', 'KAFKA_PROCESS_ADAPTER_CLASS_NAME', 'Kafkaプロセスアダプタの実装クラス名', 'com.inswave.elfw.kafka.adapter.process.DefaultKafkaProcessAdapter', 'Kafkaプロセスアダプタの実装クラス名', NULL);

INSERT INTO EL_SYS_PROP
(APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
VALUES('ElService', 'EL_CORE_PROP', 'KAFKA_IMAGE_LOG_PROCESS_CLS_NAME', 'Kafkaイメージログプロセス', 'com.inswave.elfw.kafka.img.DafaultKafkaImageLogProcess', 'Kafkaイメージログプロセス', NULL);

INSERT INTO EL_SYS_PROP
(APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
VALUES('ElService', 'EL_CORE_PROP', 'KAFKA_BOOTSTRAP_SERVERS', 'Kafka接続情報', '192.168.100.186:29092,192.168.100.186:39092,192.168.100.186:49092', 'Kafka接続情報', NULL);

INSERT INTO EL_SYS_PROP
(APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
VALUES('ElService', 'EL_CORE_PROP', 'KAFKA_CONSUMER_GROUPID', 'KafkaデフォルトリスナーグループID', 'listenMessage', 'KafkaデフォルトリスナーグループID', NULL);

INSERT INTO EL_SYS_PROP
(APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
VALUES('ElService', 'EL_CORE_PROP', 'KAFKA_TOPICS', 'Kafkaトピックリスト', 'producerTest_INFID_FLD,DmoEmpList_INFIDLIST_FLD', 'Kafkaトピックリスト', NULL);

INSERT INTO sp1_el_core.el_sys_prop
(APP_ID, SYS_GROUP_ID, SYS_KEY, SYS_SUB, SYS_VAL, SYS_DESC, SORT_SEQ)
VALUES('ElService', 'EL_CORE_PROP', 'KAFKA_CONSUMER_BASE_URL', 'KafkaコンシューマーのURL', 'http://localhost:8080/ElService/', 'KafkaコンシューマーのURL', NULL);
*/
COMMIT;
 
INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'CmmLogin' ,'com.inswave.proworks.emp.web.EmpController' ,
		'login(com.inswave.proworks.emp.vo.LoginVo,javax.servlet.http.HttpServletRequest)' ,
		'ログイン' ,'ログインを処理する。' ,'N' ,
		'CmmLogin' ,'com.inswave.proworks.emp.vo.LoginVo' ,null ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'CmmLoginFrm' ,'com.inswave.proworks.emp.web.EmpController' ,
		'loginFrm(com.inswave.proworks.emp.vo.LoginVo,javax.servlet.http.HttpServletRequest)' ,
		'ログインフォーム' ,'ログインフォームページをロードする。' ,'N' ,
		'CmmLoginFrm' ,'com.inswave.proworks.emp.vo.LoginVo' ,null ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpDel' ,'com.inswave.proworks.emp.web.EmpController' ,
		'deleteEmp(com.inswave.proworks.emp.vo.EmpVo)' ,
		'従業員情報削除' ,'従業員情報を削除処理する。' ,'N' ,
		'DmoEmpDel' ,'com.inswave.proworks.emp.vo.EmpVo' ,null ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpDown' ,'com.inswave.proworks.emp.web.EmpController' ,
		'downEmpFile(com.inswave.proworks.emp.vo.EmpVo,javax.servlet.http.HttpServletResponse)' ,
		'従業員添付ファイルダウンロード' , '従業員添付ファイルをダウンロードする。' ,'N' ,
		'DmoEmpDown' ,'com.inswave.proworks.emp.vo.EmpVo' ,null ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpIns' ,'com.inswave.proworks.emp.web.EmpController' ,
		'addEmp(com.inswave.proworks.emp.vo.EmpVo)' ,
		'従業員登録処理' ,'従業員情報を登録処理する。' ,'N' ,
		'DmoEmpIns' ,'com.inswave.proworks.emp.vo.EmpVo' ,'com.inswave.proworks.emp.vo.DeptListVo' ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpList' ,'com.inswave.proworks.emp.web.EmpController' ,
		'selectEmpList(com.inswave.proworks.emp.vo.EmpVo)' ,
		'従業員リスト照会' ,'ページング処理を行い、従業員リストを照会する。' ,'N' ,
		'DmoEmpList' ,'com.inswave.proworks.emp.vo.EmpVo' ,'com.inswave.proworks.emp.vo.EmpListVo' ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpSelect' ,'com.inswave.proworks.emp.web.EmpController' ,
		'selectEmpView(com.inswave.proworks.emp.vo.EmpVo)' ,
		'従業員情報詳細照会 (TCP内部テスト用)' ,'従業員情報詳細照会 (TCP内部テスト用)を行う。' ,'N' ,
		'DmoEmpSelect' ,'com.inswave.proworks.emp.vo.EmpVo' ,'com.inswave.proworks.emp.vo.EmpVo' ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpUpd' ,'com.inswave.proworks.emp.web.EmpController' ,
		'updateEmp(com.inswave.proworks.emp.vo.EmpVo)' ,
		'従業員リスト更新処理' ,'従業員情報を更新処理する。' ,'N' ,
		null ,'com.inswave.proworks.emp.vo.EmpVo' ,'com.inswave.proworks.emp.vo.DeptListVo' ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
values  
	( 'ElService' ,'DmoEmpUpdView' ,'com.inswave.proworks.emp.web.EmpController' ,
		'updateEmpView(com.inswave.proworks.emp.vo.EmpVo)' ,
		'従業員情報更新フォームのための照会' ,'従業員情報更新フォームのための照会を行う。' ,'N' ,
		'DmoEmpUpdView' ,'com.inswave.proworks.emp.vo.EmpVo' ,'com.inswave.proworks.emp.vo.EmpListVo' ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpUpdateUploadEmpFile' ,'com.inswave.proworks.emp.web.EmpController' ,
		'updateUploadEmpFile(javax.servlet.http.HttpServletRequest,com.inswave.proworks.emp.vo.EmpVo,org.springframework.ui.Model)' ,
		'ファイルアップロード更新' ,'ファイルアップロードを更新処理する。' ,'N' ,
		'DmoEmpUpdateUploadEmpFile' ,'com.inswave.proworks.emp.vo.EmpVo' ,null ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpUploadEmpFile' ,'com.inswave.proworks.emp.web.EmpController' ,
		'uploadEmpFileToDb(javax.servlet.http.HttpServletRequest,com.inswave.proworks.emp.vo.EmpVo,org.springframework.ui.Model)' ,
		'従業員添付ファイルアップロード' ,'従業員添付ファイルをアップロードする。' ,'N' ,
		'DmoEmpUploadEmpFile' ,'com.inswave.proworks.emp.vo.EmpVo' ,null ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpView' ,'com.inswave.proworks.emp.web.EmpController' ,
		'addEmpView(com.inswave.proworks.emp.vo.EmpVo)' ,
		'従業員登録フォームのための照会' ,'従業員登録フォームのための照会処理を行う。' ,'N' ,
		'DmoEmpView' ,'com.inswave.proworks.emp.vo.EmpVo' ,'com.inswave.proworks.emp.vo.DeptListVo' ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoTcpSendTest' ,'com.inswave.proworks.emp.web.EmpController' ,
		'tcpSendTest(com.inswave.proworks.emp.vo.EmpVo)' ,
		'TCP送信テスト' ,'TCP送信テストを行う。' ,'N' ,
		'DmoTcpSendTest' ,'com.inswave.proworks.emp.vo.EmpVo' ,'com.inswave.proworks.emp.vo.EmpVo' ) ;


INSERT INTO EL_SVC_CTR 
	( APP_ID ,SVC_ID ,AUTH_CHECK_YN ,SESSION_CHECK_YN ,XML_SVC_YN ,JSON_SVC_YN ,
		LOCK_YN ,ENABLE_START_TIME ,ENABLE_END_TIME ,SVC_PRE_POST_CLASS ,LOG_LEVEL ,
		FLD_SVC_YN ,SVC_TIME_OUT ,SVC_THREAD_MAX ,OPEN_API_USE_YN )  
VALUES  
	( 'ElService' ,'CmmLogin' ,null ,'N' ,null ,null ,null ,null ,null ,null ,null ,null ,null ,null ,null ) ;

INSERT INTO EL_SVC_CTR 
	( APP_ID ,SVC_ID ,AUTH_CHECK_YN ,SESSION_CHECK_YN ,XML_SVC_YN ,JSON_SVC_YN ,
		LOCK_YN ,ENABLE_START_TIME ,ENABLE_END_TIME ,SVC_PRE_POST_CLASS ,LOG_LEVEL ,
		FLD_SVC_YN ,SVC_TIME_OUT ,SVC_THREAD_MAX ,OPEN_API_USE_YN )  
VALUES  
	( 'ElService' ,'CmmLoginFrm' ,null ,'N' ,null ,null ,null ,null ,null ,null ,null ,null ,null ,null ,null ) ;

INSERT INTO EL_SVC_CTR 
	( APP_ID ,SVC_ID ,AUTH_CHECK_YN ,SESSION_CHECK_YN ,XML_SVC_YN ,JSON_SVC_YN ,
		LOCK_YN ,ENABLE_START_TIME ,ENABLE_END_TIME ,SVC_PRE_POST_CLASS ,LOG_LEVEL ,
		FLD_SVC_YN ,SVC_TIME_OUT ,SVC_THREAD_MAX ,OPEN_API_USE_YN )  
VALUES  
	( 'ElService' ,'DmoEmpSelect' ,null ,'N' ,null ,null ,null ,null ,null ,null ,null ,null ,null ,null ,null ) ;

INSERT INTO EL_SVC_CTR 
	( APP_ID ,SVC_ID ,AUTH_CHECK_YN ,SESSION_CHECK_YN ,XML_SVC_YN ,JSON_SVC_YN ,
		LOCK_YN ,ENABLE_START_TIME ,ENABLE_END_TIME ,SVC_PRE_POST_CLASS ,LOG_LEVEL ,
		FLD_SVC_YN ,SVC_TIME_OUT ,SVC_THREAD_MAX ,OPEN_API_USE_YN )  
VALUES  
	( 'ElService' ,'DmoTcpSendTest' ,null ,'N' ,null ,null ,null ,null ,null ,null ,null ,null ,null ,null ,null ) ;

INSERT INTO EL_SVC 
	( APP_ID ,SVC_ID ,CLASS_NM ,METHOD_NM ,SVC_SUB ,SVC_DESC ,DEL_YN ,REQ_URL ,IN_INF_ID ,OUT_INF_ID )  
VALUES  
	( 'ElService' ,'DmoEmpUpdViewJsp' ,'com.inswave.proworks.emp.web.EmpController' ,
		'updateEmpViewJsp(com.inswave.proworks.emp.vo.EmpVo)' ,
		'従業員情報更新フォームを表示するためのJSP' ,'従業員情報更新フォームを表示するためのJSPを行う。' ,'N' ,
		'DmoEmpUpdView' ,'com.inswave.proworks.emp.vo.EmpVo' ,'com.inswave.proworks.emp.vo.EmpListVo' ) ;
		
COMMIT;
