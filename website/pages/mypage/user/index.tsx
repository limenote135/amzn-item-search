import { Box, Paper, Table, TableBody, TableCell, TableContainer, TableRow, Typography } from "@mui/material";
import { useUser } from "@/plugin/auth";
import { getPlanName } from "@/util/plan";
import { useEffect, useState } from "react";
import { GetNextPayment } from "@/api/stripe";
import Link from "@/components/Link";

const User = () => {
  const user = useUser();
  const planName = getPlanName(user?.claims.plan);
  const [cardInfo, setCardInfo] = useState("");
  const [nextPayment, setNextPayment] = useState("");

  useEffect(() => {
    (async () => {
      const token = await user?.raw.getIdToken();
      if (!token) {
        setCardInfo("取得エラー");
        return;
      }
      const data = await GetNextPayment(token);
      if (data.brand === "") {
        setCardInfo("未登録");
        setNextPayment(" - ");
      } else {
        setCardInfo(`${data.brand} 下4桁: ${data.number}`);
        if (user?.claims.plan === "suspended") {
          setNextPayment("引き落とし失敗");
        } else if (data.cancelAt) {
          const cancelAt = new Date(data.cancelAt);
          setNextPayment(`無し( ${cancelAt.getFullYear()}/${cancelAt.getMonth() + 1}/${cancelAt.getDate()} で終了)`);
        } else {
          const d = new Date(data.date);
          setNextPayment(`${d.getFullYear()}/${d.getMonth() + 1}/${d.getDate()}`);
        }
      }
    })();
  }, [user]);

  return (
    <TableContainer component={Paper} sx={{ maxWidth: 600, mx: "auto" }}>
      <Table>
        <TableBody>
          <TableRow>
            <TableCell sx={{ minWidth: "150px" }}>メールアドレス</TableCell>
            <TableCell>{user?.mail}</TableCell>
            {/*<TableCell>5pvhdkjh@privaterelay.appleid.com</TableCell>*/}
          </TableRow>
          <TableRow>
            <TableCell>現在のプラン</TableCell>
            <TableCell>{planName}</TableCell>
          </TableRow>
          <TableRow>
            <TableCell>クレジットカード</TableCell>
            <TableCell>
              {cardInfo === "" ? "(読み込み中...)" : cardInfo}
              {cardInfo !== "" && cardInfo !== "未登録" && (
                <Box>
                  (カードの変更は
                  <Link href={"./user/card"}>
                    <Typography component={"span"} sx={{ textDecoration: "underline" }} color={"blue"}>
                      こちら
                    </Typography>
                  </Link>
                  )
                </Box>
              )}
            </TableCell>
          </TableRow>
          <TableRow>
            <TableCell>次回決済予定</TableCell>
            <TableCell>{nextPayment === "" ? "(読み込み中...)" : nextPayment}</TableCell>
          </TableRow>
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default User;
