package main

import (
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

func main() {
	logger, _ := zap.NewProduction()
	defer logger.Sync() // flushes buffer, if any
	sugar := logger.Sugar()
	r := gin.Default()
	sugar.Infof("Starting app!")
	k8sGroup := r.Group("/k8s-template")
	k8sGroup.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status": "UP",
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080
}
