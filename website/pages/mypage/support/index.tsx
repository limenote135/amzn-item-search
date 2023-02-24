import { Box, Paper, Tab, Tabs } from "@mui/material";
import { PropsWithChildren, useState } from "react";
import { Inquiry } from "@/components/support/inquiry";
import { Leave } from "@/components/support/leave";

type TabPanelProps = PropsWithChildren<{
  index: number;
  value: number;
}>;

function TabPanel(props: TabPanelProps) {
  const { children, value, index } = props;

  return value === index ? <Box sx={{ p: 3 }}>{children}</Box> : <div></div>;
}

const Support = () => {
  const [value, setValue] = useState(0);

  const handleChange = (event: React.SyntheticEvent, newValue: number) => {
    setValue(newValue);
  };

  return (
    <Paper sx={{ maxWidth: 800, mx: "auto" }}>
      <Box sx={{ borderBottom: 1, borderColor: "divider" }}>
        <Tabs value={value} onChange={handleChange}>
          <Tab label="問い合わせ" />
          <Tab label="アカウント削除" />
        </Tabs>
      </Box>
      <TabPanel value={value} index={0}>
        <Inquiry />
      </TabPanel>
      <TabPanel value={value} index={1}>
        <Leave />
      </TabPanel>
    </Paper>
  );
};

export default Support;
